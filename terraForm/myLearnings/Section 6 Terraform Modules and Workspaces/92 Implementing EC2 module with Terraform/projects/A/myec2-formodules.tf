module "ec2module" {
  source = "../../modules/ec2"
}

# i guess for each resource the path will have to be absolute, we cannot have the path at
# folder level, i think it will have to be resource specfic file or 
# this type of file is calling all the resource defined in the module directory
