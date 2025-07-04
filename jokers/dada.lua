SMODS.Joker { --dada
  key = 'dada',
  rarity = 1,
  atlas = 'T.Jokers',
  pos = { x = 2, y = 1 },
  cost = 5,
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  in_pool = function(self, args)
    if (next(SMODS.find_mod('extracredit')) and tes.config.suppression_plushie == 2) then
      return false
    end
    return true
  end,
  no_collection = (next(SMODS.find_mod('extracredit')) and tes.config.suppression_plushie == 2) and true or nil,
  config = { extra = { chips_add = 20 } },
  loc_vars = function(self, info_queue, card)
    local total_cards = (G.jokers and #G.jokers.cards or 0)
    return { vars = { card.ability.extra.chips_add, total_cards*card.ability.extra.chips_add } }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      local total_cards = #G.jokers.cards
      return {
        message = localize{type='variable', key='a_chips', vars={ total_cards * card.ability.extra.chips_add }},
        chip_mod = total_cards * card.ability.extra.chips_add,
        colour = G.C.CHIPS
      }
    end
  end
}