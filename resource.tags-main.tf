
### ################################################ ###
### [[data]] sources for portable terraform software ###
### ################################################ ###

data aws_caller_identity with {}
data aws_region with {}


### ################################################################## ###
### [[local]] attributes that help with constructing AWS resource tags ###
### ################################################################## ###

locals
{
    /*
     | Example Note ~> "was created by eks-curator in London at 14:35."
     */
    username   = "${ element( split( "/", data.aws_caller_identity.with.arn ), 1 ) }"
    city_plus  = "${ element( split( "(", data.aws_region.with.description ), 1 ) }"
    city_name  = "${ element( split( ")", local.city_plus ), 0 ) }"
    time_hhmm  = "${ substr( timestamp(), 11, 5 ) }"
    descriptor = "was created by ${local.username} in ${local.city_name} at ${local.time_hhmm}."

    /*
     | Raw Timestamp = 2018-09-11T14:35:59Z
     | Eco Timestamp = "80911-1435"
     */
    year_y    = "${ substr( element( split( "-", timestamp() ), 0 ), 3, 1 ) }"
    month_no  = "${ element( split( "-", timestamp() ), 1 ) }"
    day_dd    = "${ substr( element( split( "-", timestamp() ), 2 ), 0, 2 ) }"
    hour_hh   = "${ substr( element( split( ":", timestamp() ), 0 ), 11, 2 ) }"
    min_mm    = "${ element( split( ":", timestamp() ), 1 ) }"
    timestamp = "${ local.year_y }${ local.month_no }${ local.day_dd }${ local.hour_hh }${ local.min_mm }"
}

