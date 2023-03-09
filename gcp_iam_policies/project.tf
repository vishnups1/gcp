/*
resource "google_project_iam_policy" "project_policy" {
  project = local.project_id
  policy_data = jsonencode(
    {
      bindings = [
        {
          # we cannot add members to "roles/owner" role as this is only allowed via console.
          members = [
            "user:abc@gmail.com",
          ]
          role = "roles/owner"
        }
      ]
    }
  )
}
*/

# authoritative for "roles/viewer" role.
resource "google_project_iam_binding" "role_viewer" {
  project = local.project_id
  role = "roles/viewer"
  members = [
    "user:xyz@gmail.com",
  ]
}

/*
# authoritative for "roles/iam.securityAdmin" role.
resource "google_project_iam_binding" "role_security_admin" {
  project = local.project_id
  role = "roles/iam.securityAdmin"
  members = [
    "user:xyz@gmail.com",
  ]
}
*/

# authoritative for "roles/compute.securityAdmin" role.
resource "google_project_iam_binding" "role_compute_security_admin" {
  project = local.project_id
  role = "roles/compute.securityAdmin"
  members = [
    "user:xyz@gmail.com",
  ]
}

/*
~ → gcloud projects get-iam-policy my-project-1509295317174

bindings:
- members:
  - user:abc@gmail.com
  role: roles/owner
- members:
  - user:xyz@gmail.com
  - user:abc@gmail.com
  role: roles/viewer
etag: BwX2Y-zLCzM=
version: 1
*/