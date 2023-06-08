# Query medium instance size
data "civo_size" "medium" {
    filter {
        key = "name"
        values = ["g4s.kube.medium"]
    }

    sort {
        key = "ram"
        direction = "asc"
    }
}
