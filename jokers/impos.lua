SMODS.Joker { --impos
  key = 'impos',
  config = { extra = { Xmult = 3, twos = false, eights = false } },
  rarity = 2,
  atlas = 'T.Jokers',
  pos = { x = 3, y = 1 },
  cost = 8,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult } }
  end,
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
      for i = 1, #context.scoring_hand do
        if context.other_card:get_id() == 2 then
          card.ability.extra.twos = true
        elseif context.other_card:get_id() == 8 then
          card.ability.extra.eights = true
        end
      end
    end
    if context.joker_main and card.ability.extra.twos == true and card.ability.extra.eights == true then
      card.ability.extra.twos = false
      card.ability.extra.eights = false
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
        Xmult_mod = card.ability.extra.Xmult
      }
    end
  end
}