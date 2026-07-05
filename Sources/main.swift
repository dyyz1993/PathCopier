import Foundation

// ─────────────────────────────────────────────────────────
// PathCopier — 点一下 → "啵" → 复制路径 → 退出
// ─────────────────────────────────────────────────────────

// 先出声（后台播，不等）
let pop = Process()
pop.executableURL = URL(fileURLWithPath: "/usr/bin/afplay")
pop.arguments = ["/System/Library/Sounds/Pop.aiff"]
try? pop.run()

// 复制路径
let script = """
tell application "Finder"
    set sel to selection
    if sel is not {} then
        set the clipboard to (POSIX path of (item 1 of sel as alias)) as text
    end if
end tell
"""
_ = NSAppleScript(source: script)?.executeAndReturnError(nil)
exit(0)
