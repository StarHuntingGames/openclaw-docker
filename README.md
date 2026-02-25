A convenient OpenClaw docker helper

---
Run `make all` to build the docker images
---
Run `make onboard` to config your OpenClaw
---
Run `make compose` to run your OpenClaw in the docker
---
If you got 
<br/>
`Gateway failed to start: Error: non-loopback Control UI requires gateway.controlUi.allowedOrigins (set explicit origins), or set gateway.controlUi.dangerouslyAllowHostHeaderOriginFallback=true to use Host-header origin fallback mode` 
<br/>
Add 
```
"controlUi":{
  "dangerouslyAllowHostHeaderOriginFallback":true
}
``` 
under `"gateway"` in the file `config/openclaw/openclaw.json`, then you can stop and run `make compose` again
---
Run `make dashboard` to get the login url
---
If you got <br/>`pairing required`<br/>,
you can run `make devices` to list all the pending approvals.
Then you can run `make approve` to approve the lastest pending approval.
---


