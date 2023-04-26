# auto-semver

A GitHub action for automatically semantic versioning a repository when a closing and merging in a pull request.


## Inputs
- **token:** Token to use to push to the repo. Pass in using `secrets.GITHUB_TOKEN`. (required)
- **prefix:** The prefix prepended to the version number. Default is `v`.

## Outputs
This action does not output any artifacts.

## Secrets
This action does not use any secrets.

## Usage
Learn more about GitHub Actions in general [here](https://docs.github.com/en/actions/quickstart). 

To use this action in your repo, follow these steps:

 1. Create a YAML file in the `.github/workflows/` directory of your repo.
 2.  Copy the following into the YAML file:
```yaml
name: Auto Semver
on:
  pull_request:
    types: closed
    branches:
      - main
jobs:
  update:
    if: github.event.pull_request.merged == true
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3
      - name: Run Auto Semver
        uses: discoverygarden/auto-semver@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
```
This will run the automatic semantic versioning on closed pull requests to the main branch of a repository. Before it runs the job, it'll also check to see if the pull request is `Merged`, if it was simply closed, it won't run the jobs, as we don't want to increment the version number on any closed pull requests except for ones that have been merged.
