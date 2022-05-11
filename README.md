# Pre Commit Hooks for Kubernetes

Assorted pre-commit hooks for use with kubernetes.

## Using

1) You will first need to have [pre-commit installed](https://pre-commit.com/index.html#installation).

2) Add a `.pre-commit-config.yaml` file to your repo:
```yaml
repos:
  - repo: https://github.com/plentiau/pre-commit-kube-hooks
    rev: v0.1.0
    hooks:
      - id: kubectl-kustomize
```
3) Run `pre-commit install` to setup git hook scripts.

## Hooks available

**`kubectl-kustomize`**

Validates all `kustomization.yaml` files render to a valid kubernetes manifest.

Requires:
- kubectl
