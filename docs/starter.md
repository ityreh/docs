# Starter

The starters help you kick off into a project so you can get started right away.

## Django

TODO:

- cookiecutter for project layout templating?
- django-environ?

Initialize your django application in your project folder and change base layout.

    django-admin startproject config
    mv ./config/manage.py .
    mv ./config/config/* ./config
    rm -R ./config/config

Create multiple environment specific settings and requirements files.

    mkdir ./config/settings
    touch ./config/settings/__init__.py
    mv ./config/settings.py ./config/settings/base.py

You can create specific settings which imports `base.py`, eg. `local.py`, `staging.py` or `production.py`:

    from .base import *

    ...

[Do the same with your requirements]().


Start an app:

    python manage.py startapp <app_name>

## React Electron

Initialize your react client in your project folder and cd into the client folder.

    create-react-app client
    cd client

From there install electron and a package to detect if it runs in a development or production environment.

    npm install --save-dev electron
    npm install electron-is-dev

We create the main electron script in `public/` as `electron.js` and enter the following code.

```javascript
const path = require("path");

const { app, BrowserWindow } = require("electron");
const isDev = require("electron-is-dev");

function createWindow() {
  const win = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: true
    }
  });

  win.loadURL(
    isDev
      ? "http://localhost:3000"
      : `file://${path.join(__dirname, "../build/index.html")}`
  );

  if (isDev) {
    win.webContents.openDevTools({ mode: "detach" });
  }
}

app.whenReady().then(createWindow);

app.on("window-all-closed", () => {
  if (process.platform !== "darwin") {
    app.quit();
  }
});

app.on("activate", () => {
  if (BrowserWindow.getAllWindows().length === 0) {
    createWindow();
  }
});
```

In `package.json` you can configure this script as the starting point.

```json
{
  "main": "public/electron.js", // Add starting point here
}
```

Now we configure the behavior for starting our development environment and we use two more packages for it.

    npm i --save-dev concurrently wait-on

The configuration is done in the `package.json` again.

```json
{
  "scripts": {
    "dev": "concurrently -k \"BROWSER=none npm start\" \"npm:electron\"",
    "electron": "wait-on tcp:3000 && electron .",
  }
}
```

To run the app in development mode, you can use `npm run dev`.
