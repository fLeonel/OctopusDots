local Job = require("plenary.job")

local repo_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
if repo_root == "" or repo_root == nil then
  print("❌ No estás en un repo git")
  os.exit(1)
end

local diff = table.concat(vim.fn.systemlist("git diff --cached --stat"), "\n")
if diff == "" then
  diff = "(no hay cambios staged)"
end

local prompt = [[
Eres un asistente experto en desarrollo.
Genera un mensaje de commit profesional, conciso y en español.
Formato:
Primera línea: [TIPO] resumen breve (por ejemplo [FIX], [FEAT], [CHORE]).
Luego, una descripción corta con viñetas (máx. 5 líneas).
Basado en el siguiente diff:\n\n
]] .. diff

Job:new({
  command = "codex",
  args = { prompt },
  on_exit = function(j)
    local output = table.concat(j:result(), "\n")
    if output == "" then
      output = "[AUTO] Commit generado automáticamente.\n" .. diff
    end

    local path = repo_root .. "/.git/AI_COMMIT_MSG"
    local file = io.open(path, "w")
    if file then
      file:write(output)
      file:close()
      print("✅ Mensaje IA escrito en " .. path)
    else
      print("❌ No se pudo escribir mensaje IA.")
    end
  end,
}):start()
