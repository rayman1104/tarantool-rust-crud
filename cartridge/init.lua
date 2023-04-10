#!/usr/bin/env tarantool

require('strict').on()

-- configure path so that you can run application
-- from outside the root directory
package.setsearchroot()

-- configure cartridge

local cartridge = require('cartridge')

local ok, err = cartridge.cfg({
    roles = {
        'cartridge.roles.vshard-storage',
        'cartridge.roles.vshard-router',
        'cartridge.roles.metrics',
        'app.roles.custom',
        'app.roles.customers-storage',
        'app.roles.customers-router',
    },
})

assert(ok, tostring(err))

-- register admin function to use it with 'cartridge admin' command

local admin = require('app.admin')
admin.init()

local metrics = require('cartridge.roles.metrics')
metrics.set_export({
    {
        path = '/metrics',
        format = 'prometheus'
    },
    {
        path = '/health',
        format = 'health'
    }
})
