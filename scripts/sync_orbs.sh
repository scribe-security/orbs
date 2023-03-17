#!/bin/bash
set +x

submodules_dir="sub"
[ ! -d "${submodules_dir}" ] && mkdir "${submodules_dir}"
base="git@github.com:scribe-security"
supported_repos=("valint")

pull_submodules() {
    repo=$1
    echo "Download repo $${repo}"
    repo_url="${base}/${repo}"
    repo_dir="${submodules_dir}/${repo}"
    [[ ! -d "${repo_dir}" ]] && git clone --depth 1 "${repo_url}" "${repo_dir}"
    pushd "${repo_dir}"
    git checkout master || git checkout main
    git pull origin master || git pull origin main
    popd
}

checkout_submodules() {
    repos=$1
    for repo in "${repos[@]}"
    do
        echo "#### Checkout repo $${repo} ####"
        repo_url="${base}/${repo}"
        repo_dir="${submodules_dir}/${repo}"
        [[ ! -d "${repo_dir}" ]] && git clone --depth 1 "${repo_url}" "${repo_dir}"
        pushd "${repo_dir}"
        git checkout master || git checkout main
        git pull origin master || git pull origin main
        git branch -D doc_export
        git checkout -b doc_export
        popd
    done
}

status_submodules() {
    repos=$1
    for repo in "${repos[@]}"
    do
        echo -e "\n#### Status repo ${repo} "####
        repo_url="${base}/${repo}"
        repo_dir="${submodules_dir}/${repo}"
        [[ ! -d "${repo_dir}" ]] && git clone --depth 1 "${repo_url}" "${repo_dir}"
        pushd "${repo_dir}"
        git status
        git diff
        popd
    done
}

add_push_submodule() {
    repo=$1
    echo "#### Push repo $${repo} ####\n"
    repo_url="${base}/${repo}"
    repo_dir="${submodules_dir}/${repo}"
    [[ ! -d "${repo_dir}" ]] && git clone --depth 1 "${repo_url}" "${repo_dir}"
    pushd "${repo_dir}"
    git add *.yaml
    git commit -m "export orbs"
    git push -f origin orbs_export
    popd
}

import_orbs() {
    set -x
    repo=$1
    repo_dir="${submodules_dir}/${repo}"
    cp -r "${repo_dir}/circleci/commands/" "src/"
}

export_orbs() {
    repo=$1
    repo_dir="${submodules_dir}/${repo}"
    cp -r "src/commands/" "${repo_dir}/circleci"
    rm "${repo_dir}/circleci/install.yaml"
    # mv "docs/CLI/${repo}/README.md" "${repo_dir}/README.md" 
    export_file ${repo} "" "${dst_dir}"
}

import_valint() {
    import_orbs valint
}

export_valint() {
    export_orbs valint
    add_push_submodule valint
}



usage() {
  this=$1
  cat <<EOF
$this: Sync docs with submodules
Usage: $this [-b] bindir [-d] [-t tool]
  -I import docs from submodules
  -E export docs to submodules
  -S status of submodules"
EOF
  exit 2
}


parse_args() {
  while getopts "r:IESLdh?x" arg; do
    case "$arg" in
      x) set -x ;;
      r) repos+=(${OPTARG});;
      I) COMMAND="import";;
      E) COMMAND="export";;
      S) COMMAND="status";;
      L) LOCAL="true";;
      h | \?) usage "$0" ;;
    esac
  done
  shift $((OPTIND - 1))
}

function processItems
{
    local -r PROCESSING_FUNCTION=$1
    shift 1
    
    for item in "$@"
    do
        $PROCESSING_FUNCTION 
    done
}

COMMAND="unknown"
parse_args "$@"
if (( ${#repos[@]} == 0 )); then
    # repos="${supported_repos[@]}"
    repos=("${supported_repos[@]}")                  #copy the array in another one 
fi 

case $COMMAND in
  import)
    if [ ! -z "$LOCAL" ]; then
        pull_submodules "valint"
    fi
    import_valint
    ;;

  export)
    echo -n "export"
    if [ ! -z "$LOCAL" ]; then
        checkout_submodules "valint"
    fi
    export_valint
    ;;
  status)
        status_submodule "valint"
    ;;
  *)
    echo -n "unknown"
    ;;
esac
