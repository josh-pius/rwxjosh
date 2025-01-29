### General
- Calls the default window procedure to provide default processing for any window messages that an application does not process. 
- This function ensures that every message is processed. DefWindowProc is called with the same parameters received by the window procedure.
- Has the same syntax as a regular [[Windows Procedure (Windows API)]]
```
LRESULT DefWindowProcA(
  [in] HWND   hWnd,
  [in] UINT   Msg,
  [in] WPARAM wParam,
  [in] LPARAM lParam
);
```
- [[Molly Rocket (Youtuber)|Casey Muratori (Youtuber)]] explained that we might not want to handle every message but only a subset and let windows handle all the rest based on defaults it's prescribed

### Sources
[[Handmade Hero (Video Series)]]