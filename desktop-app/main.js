const { app, BrowserWindow } = require('electron');
const path = require('path');
const url = require('url');

// Disable hardware acceleration early to improve compatibility in headless or
// container environments where GPU support is incomplete.
app.disableHardwareAcceleration();
app.commandLine.appendSwitch('disable-gpu');
app.commandLine.appendSwitch('disable-gpu-compositing');
app.commandLine.appendSwitch('disable-software-rasterizer');
app.commandLine.appendSwitch('no-sandbox');

function createWindow() {
  const win = new BrowserWindow({
    width: 430,
    height: 920,
    resizable: true,
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
      preload: path.join(__dirname, 'preload.js')
    }
  });

  const target = path.join(__dirname, '..', 'index.html');
  win.loadFile(target);
}

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) createWindow();
});
