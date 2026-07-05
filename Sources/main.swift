import Foundation

// ─────────────────────────────────────────────────────
// PathCopier — 点一下 → "叮" → 退出 → 后台复制
// ─────────────────────────────────────────────────────

// 先出声（afplay 独立进程，App 退出后继续播）
let sound = Process()
sound.executableURL = URL(fileURLWithPath: "/usr/bin/afplay")
sound.arguments = ["/System/Library/Sounds/Tink.aiff"]
try? sound.run()

// 后台复制路径
let task = Process()
task.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
task.arguments = ["-e", """
tell application "Finder"
    set sel to selection
    if sel is not {} then
        set the clipboard to (POSIX path of (item 1 of sel as alias)) as text
    end if
end tell
"""]
try? task.run()

exit(0)
