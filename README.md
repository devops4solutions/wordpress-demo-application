# Custom Wordpress Image Demo

This repository demonstrates how to extend the base wordpress image to use for creating and deploying a site with custom themes and plugins.

# Deploy Ingress on GKE

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.43.0/deploy/static/provider/cloud/deploy.yaml

```

# Deploy wordpress using Helm chart

```
 helm install nidhitest bitnami/wordpress -f values.yaml 

```
You can customize the values.yaml file as per your need

# Deploy using Ingress

In `values.yaml` file - update the below tag
You can provide the hostname which you want to use. 
```
ingress:
  ## Set to true to enable ingress record generation
  ##
  enabled: true
  hostname: wordpress.local

  ## The Path to WordPress. You may need to set this to '/*' in order to use this
  ## with ALB ingress controllers.
  ##
  path: /

```

If you are doing the local testing then 
update the `/etc/hosts` file with the below content. You can get the ingressIp using `kubectl get ingress'

```
ingressIp     wordpress.local
```
# Login to wordpress

```
http://wordpress.local/wp-login.php

Username : user
password : Run this command : echo Password: $(kubectl get secret --namespace default nidhitest-wordpress -o jsonpath="{.data.wordpress-password}" | base64 --decode)
```
