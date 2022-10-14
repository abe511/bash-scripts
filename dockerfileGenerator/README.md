## Generate a Dockerfile

### build & run it
---
you can choose: 
- an image (ubuntu or centos)
- image version
- http server to install (nginx or apache)
- a port number your website should be accessible on

---

copy all your website files into the `public` directory


run:

```
bash ./generate.sh
```

enter your preferences
the script will generate a dockerfile, then build an image and deploy a container


go to `localhost:<port_number>` to see your website