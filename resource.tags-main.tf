
### ################################################ ###
### [[data]] sources for portable terraform software ###
### ################################################ ###

data aws_caller_identity with {}
data aws_region with {}


### ################################################################## ###
### [[local]] attributes that help with constructing AWS resource tags ###
### ################################################################## ###

locals {

    /*
     | Example Note ~> "was created in Ireland on Tue 02 Jan 2018 at 23:12:01."
     */
    username   = element( split( "/", data.aws_caller_identity.with.arn ), 1 )
    city_plus  = element( split( "(", data.aws_region.with.description ), 1 )
    city_name  = element( split( ")", local.city_plus ), 0 )

    time_value = timeadd( timestamp(), "1h" )
    readable_d = formatdate( "EEE DD MMM YYYY", local.time_value )
    readable_t = formatdate( "hh:mm:ss", local.time_value )
    descriptor = "was created in ${ local.city_name } on ${ local.readable_d } at ${ local.readable_t }."

    /*
     | Raw Timestamp = 2018-09-11T14:35:59Z
     | Eco Timestamp = "809111435"
     */
    year_y    = substr( element( split( "-", local.time_value ), 0 ), 3, 1 )
    month_no  = element( split( "-", local.time_value ), 1 )
    day_dd    = substr( element( split( "-", local.time_value ), 2 ), 0, 2 )
    hour_hh   = substr( element( split( ":", local.time_value ), 0 ), 11, 2 )
    min_mm    = element( split( ":", local.time_value ), 1 )
    timestamp = "${ local.year_y }${ local.month_no }${ local.day_dd }${ local.hour_hh }${ local.min_mm }"
}

