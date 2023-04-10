local cartridge = require('cartridge')

return {
    role_name = 'app.roles.customers-storage',
    init = function()
        local customers_space = box.schema.space.create('customers', {
            format = {
                {name = 'id', type = 'unsigned'},
                {name = 'bucket_id', type = 'unsigned'},
                {name = 'name', type = 'string'},
                {name = 'age', type = 'number'},
            },
            if_not_exists = true,
        })
        customers_space:create_index('id', {
            parts = { {field ='id', is_nullable = false} },
            if_not_exists = true,
        })
        customers_space:create_index('bucket_id', {
            parts = { {field ='bucket_id', is_nullable = false} },
            if_not_exists = true,
        })
        customers_space:create_index('age', {
            parts = { {field ='age'} },
            unique = false,
            if_not_exists = true,
        })
    end,
    dependencies = {'cartridge.roles.crud-storage'},
}