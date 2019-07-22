
####### ############################################ ########
######## Outputs from this ecosystem instance module ########
####### ############################################ ########

### ############################ ###
### [[output]] out_tag_timestamp ###
### ############################ ###

output out_tag_timestamp {

    description = "A timestamp for resource tags in the format ymmdd-hhmm like 80911-1435"
    value       = "${local.timestamp}"
}


### ############################## ###
### [[output]] out_tag_description ###
### ############################## ###

output out_tag_description {

    description = "Ubiquitous note detailing who, when, where and why for every infrastructure component."
    value       = "${local.descriptor}"
}
