import Foundation

// ─────────────────────────────────────────────────────────
// PathCopier — 极简 Finder 工具栏工具
// 点一下 → 复制路径 → 退出
// ─────────────────────────────────────────────────────────

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
