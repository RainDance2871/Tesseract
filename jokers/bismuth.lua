SMODS.Joker { --bismuth
  key = 'bismuth',
  
   in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
      if SMODS.has_enhancement(playing_card, 'm_wild') then
        return true
      end
    end
    return false
  end,
  
  config = { extra = { repetitions = 2 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
    return {vars = { card.ability.extra.repetitions } } 
  end,
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  atlas = 'T.Jokers',
  pos = { x = 4, y = 0 },
  rarity = 2,
  cost = 7,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.repetition and not context.repetition_only then
      if context.other_card.ability.name == "Wild Card" then
        return {
          message = 'Again!',
          repetitions = card.ability.extra.repetitions,
          card = context.other_card
        }
      end
    end
  end
  

}