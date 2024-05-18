Section 4\49 Data Types> terraform plan
var.my-list-practice
Enter a value: ["pyhton3", "Helloworld", "ram", "gauri"]

var.my-numbered-list
Enter a value: [1,2,3,4,5]

      + vpc_security_group_ids               = [
          + "sg-06dc77ed59c310f03",
          + "sg-06dc77ed59c31d431",
        ]
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:

- variable_value = [
  - "pyhton3",
  - "Helloworld",
  - "ram",
  - "gauri",
    ]

────────────

```hcl
output "variable_value" {
  value = [var.my-list-practice, var.my-numbered-list]
}

```

var.my-list-practice
Enter a value: ["python", "ram", "guari"]

var.my-numbered-list
Enter a value: ["1","2","3","4"]

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:

- variable_value = [
  - [
    - "python",
    - "ram",
    - "guari",
      ],
  - [
    + 1,
    + 2,
    + 3,
    + 4,
    ],
    ]
