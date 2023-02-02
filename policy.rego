package policy

mandatory_tags[msg] {
  check_tags(changes[c])
  msg := sprintf("fail: %v is missing required tags.", [changes[c].address])
}

check_tags(resource) {
 # read the tags based on the resource type
 tags = read_tags(resource)
 # check for the tag enforcement
 match(resource.change.after)
}

read_tags(resource) = tags {
 tags = resource.change.after.tags
}

match(i) {
	not i.tags
}

match(i) {
	not i.tags.AgileTeam
}

match(i) {
	not i.tags.Contact
}

match(i) {
	not i.tags.Environment
}

match(i) {
	not i.tags.Repository
}

# get the changed resources
changes := { c |
	some path, value
	walk(input, [path, value])
	reverse_index(path, 1) == "resource_changes"
	c = value[_]
}

reverse_index(path, idx) = value {
	value := path[count(path) - idx]
}
