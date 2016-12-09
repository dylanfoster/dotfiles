npms() {
  npm search --registry=https://registry.npmjs.org $argv
}

alias package-version='cat package.json | json version'
