
# AWS Resource Tags | ID and Description

This module produces a timestamp and a verbose description to aid other Terraform modules in creating context specific information to ply into AWS resource tags.

## Usage

```hcl
module resource-tags
{
    source = "github.com/devops4me/terraform-aws-resource-tag-ids"
}
```


## Output

- **`out_tag_timestamp`** | the 10 character timestamp
- **`out_tag_description`** | a description giving who, when and where details


## The Tag Timestamp

The 10 character timestamp is created from Terraform's timestamp function.

    81204-1538
    4th December 2018 at 3:38PM

The timestamp is UTC based and its characters are as follows

- the single digit year
- the two-digit month (from 01 to 12)
- the two-digit day of the month (from 01 to 31)
- a hyphen
- the (24) hour and minute


## The Tag Description

    was created by joebloggs in Dublin at 17:46

The history note produced uses data sources to detail

- the AWS IAM user who is creating the components
- the city related to the region like Paris, Dublin, London and Frankfurt
- the time the resource was created

This history note can be used to populate AWS tags to clarify the ecosystem instance the component belongs to as well as the who, when and what.
