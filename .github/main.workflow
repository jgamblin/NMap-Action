workflow "New workflow" {
  on = "push"
  resolves = ["NMap"]
}

action "NMap" {
  uses = "./NMap"
  secrets = ["GITHUB_TOKEN"]
}
