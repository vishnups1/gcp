resource "google_project_service" "enable_compute_api" {
  service = "compute.googleapis.com"
}

resource "google_compute_network" "hello_world" {
  name                    = "hello-world"
  auto_create_subnetworks = false
  depends_on = [
    google_project_service.enable_compute_api
  ]
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-subnet"
  ip_cidr_range = "192.168.10.0/24"
  region        = "us-central1"
  network       = google_compute_network.hello_world.id
}

resource "google_compute_subnetwork" "private_subnet" {
  name                     = "private-subnet"
  ip_cidr_range            = "192.168.20.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.hello_world.id
  private_ip_google_access = true
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-access-to-public-instance"
  network = google_compute_network.hello_world.id
  allow {
    protocol = "tcp"
    ports = [
      "22"
    ]
  }
  source_ranges = [
    "0.0.0.0/0"
  ]
  source_tags = [
    "public-instance"
  ]
}

resource "google_compute_instance" "test_instance" {
  name         = "public-instance"
  zone         = "us-central1-a"
  machine_type = "e2-micro"
  network_interface {
    network    = google_compute_network.hello_world.id
    network_ip = "192.168.10.11"
    subnetwork = google_compute_subnetwork.public_subnet.id
  }
  # https://cloud.google.com/vpc/docs/add-remove-network-tags
  tags = [
    "public-instance"
  ]
  boot_disk {
    initialize_params {
      # gcloud compute images list
      image = "centos-cloud/centos-7"
    }
  }
  metadata = {
    "enable-oslogin" : "TRUE"
  }
}

# gcloud compute ssh public-instance --zone=us-central1-a