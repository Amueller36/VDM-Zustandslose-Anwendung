kubectl auth can-i get pods --namespace=stateless-app-ns --as=hans
kubectl auth can-i list services --namespace=stateless-app-ns --as=hans
kubectl auth can-i watch configmaps --namespace=stateless-app-ns --as=hans
kubectl auth can-i create deployments --namespace=stateless-app-ns --as=hans
kubectl auth can-i update deployments --namespace=stateless-app-ns --as=hans
kubectl auth can-i delete pods --namespace=stateless-app-ns --as=hans
kubectl auth can-i list pods/log --namespace=stateless-app-ns --as=hans


kubectl auth can-i get pods --namespace=stateless-app-ns --as=moritz
kubectl auth can-i list services --namespace=stateless-app-ns --as=moritz
kubectl auth can-i watch configmaps --namespace=stateless-app-ns --as=moritz
kubectl auth can-i create deployments --namespace=stateless-app-ns --as=moritz
kubectl auth can-i update deployments --namespace=stateless-app-ns --as=moritz
kubectl auth can-i delete pods --namespace=stateless-app-ns --as=moritz
kubectl auth can-i list pods/log --namespace=stateless-app-ns --as=moritz
