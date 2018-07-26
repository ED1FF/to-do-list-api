ActiveAdmin.register Task do
  permit_params :id, :name, :description, :done

end
