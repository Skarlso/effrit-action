# effrit-action

A github action for [effrit](https://github.com/Skarlso/effrit).

## Example Action

A simple example on how to use this action:

```yaml
name: Effrit
on: pull_request
jobs:
  effrit:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Unshallow
        run: git fetch --prune --unshallow
      - name: Effrit
        uses: skarlso/effrit
        with:
          pr_number: ${{ github.event.pull_request.number }}
          owner: Skarlso
          repo: effrit
          project_name: effrit
          parallel_files: 5
        env:
          EFFRIT_GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
