variable "initiative_definition" {
  type        = string
  description = "Initiative Definition"
}
variable "initiative_definition2" {
  type        = string
  description = "Initiative Definition2"
}


variable "environment" {
  type        = string
  description = "dev"
}

variable "assignment" {
  type = object({
    assignments = list(object({
      id   = string
      name = string
    }))
    scope = optional(string, "rg")
  })
  description = "Global Core Initiative"

  validation {
    condition = contains(
      ["sub", "mg", "rg"],
      var.assignment.scope
    )
    error_message = "Err: invalid assignment scope."
  }
}

variable "exemptions" {
  type = list(object({
    id                   = string
    risk_id              = string
    scope                = string
    category             = string
    assignment_reference = string
  }))
  description = "Global Core Exemptions"

  validation {
    condition = alltrue(
      [
        for exemption in var.exemptions :
        contains(
          ["sub", "mg", "rg"],
          exemption.scope
        )
      ]
    )
    error_message = "Err: invalid exemption scope."
  }

  validation {
    condition = alltrue(
      [
        for exemption in var.exemptions :
        contains(
          ["Mitigated", "Waiver"],
          exemption.category
        )
      ]
    )
    error_message = "Err: invalid exemption category."
  }

  default = []
}
