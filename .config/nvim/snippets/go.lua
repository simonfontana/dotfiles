-- all variables are from LuaSnip documentation
local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key


return {
    s({ trig = "fn", name = "Function", dscr = "Insert new function" }, {
        t("func "), i(1), t("("), i(2), t(") "), i(3), t("{"),
        t({"", "  "}), i(4),
        t({"", "}"}),
    }),

    s({ trig = "pf", name = "Formatted Print", dscr = "Insert formatted print statement" }, {
        t("fmt.Printf(\""), i(1), t("\", "), i(2), t(")")
    }),

    s({ trig = "pv", name = "Print Variable", dscr = "Insert formatted print variable statement" }, {
        t("fmt.Printf(\"%+v\\n\", "), i(1), t(")")
    }),

    parse({ trig = "ife", name = "If Error", dscr = "Insert basic if err != nil statement" }, [[
        if err != nil {
            return err
        }
    ]]),

    s({ trig = "ifew", name = "If Error Wrapped", dscr = "Insert if err != nil statement with wrapped error" }, {
        t("if err != nil {"),
        t({ "", "  return fmt.Errorf(\"failed to " }), i(1), t(": %w\", err)"),
        t({ "", "}" })
    }),
}
