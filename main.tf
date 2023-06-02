terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.46"
    }
  }
}

# Configure the Okta Provider
provider "okta" {
  org_name  = var.org_name
  base_url  = var.base_url
  api_token = var.api_token
}

data "okta_brands" "natl" {}

# resource has been imported into current state:
# $ terraform import okta_theme.example <theme id>
resource "okta_theme" "natl" {
  brand_id                               = tolist(data.okta_brands.natl.brands)[0].id
  logo                                   = "./CoBrand_okta_theme.png"
  favicon                                = ""
  background_image                       = ""
  primary_color_hex                      = "#1662dd"
  primary_color_contrast_hex             = "#ffffff"
  secondary_color_hex                    = "#ebebed"
  secondary_color_contrast_hex           = "#000000"
  sign_in_page_touch_point_variant       = "OKTA_DEFAULT"
  end_user_dashboard_touch_point_variant = "OKTA_DEFAULT"
  error_page_touch_point_variant         = "OKTA_DEFAULT"
  email_template_touch_point_variant     = "FULL_THEME"
}