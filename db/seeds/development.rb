# Table name: texts
#
#  id         :integer          not null, primary key
#  name       :string
#  content    :text
#  author     :string
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null

Text.destroy_all

Text.create(
  name: 'PostCapitalism',
  author: 'Paul Mason',
  content: <<PC
# Introduction

In short, the argument of this book is

> *that capitalism is a complex, adaptive system which has reached the limits of its capacity to adapt.*[^1]

[^1]:
    p xiii, emphasis original.

According to the OECD, growth in the developed world will be 'weak' for the next fifty years.  By 2060, the growth currently enjoyed by developing countries will have petered out, and they will have converged with the stagnation of rich countries.  Capitalism (and particularly neoliberalism) is no longer capable of delivering the steady increases in wealth which used to be the only means by which it could be justified.

Since 2008, the financial crisis has pushed neoliberalism towards a more abrupt crisis.  The economic crisis quickly became a social crisis, directly linked with emerging civil wars and superpower conflict.  Extrapolating current trends over the first half of the twenty first century leads to two plausible trajectories:

  1. The global elite maintains control; the IMF/WB/WTO retain (weakened) authority over the global economy and the costs of austerity and stagnation are passed on to ordinary people of the developed world.
  1. The power of elites is broken, and parties of the hard right and hard left take power.  The costs of the failure of neoliberalism are imposed not on each countries' own populations, but on neighbouring countries.  In some ways reminiscent of the 1930s, globalism falls apart as international institutions lose control and recent conflicts ("drug wars, post-Soviet nationalism, jihadism, uncontrolled migration"((p x))) flare.

By 2050, climate change, demographic ageing and population growth will make either scenario untenable, and the following decades will be "chaos".

The purpose of this book is to propose an alternative.  Not a plan, but a combination of historical and economic analysis that will illuminate how individuals and the state can nurture the seeds of a new economic order that is already a substantial force worldwide.

Capitalism is a complex and *evolving* organism that develops new means to neutralise or incorporate emerging challenges.  Historically, it has been particularly good at adapting to new technology, but for various reasons, information technology threatens its existence.  This technology spontaneously "dissolve[s] markets, destroy[s] ownership and break[s] down the relationship between work and wages.  And that is the deep background to the crisis we are living through"((p xiv)).

The left has been wrong about how capitalism will end.  It will not be defeated by governments taking back economic power and reconfiguring production along non-market models.  It will be replaced by new forms of economic collaboration that emerge within market economies but which rely on fundamentally different "values, behaviours and norms"((p xiv)).  Postcapitalism is possible because of three features of new technology:

  1. IT has reduced the need for work and blurred the lines between work and notwork.
  1. Capitalism can't set prices for information goods because they are not inherently scarce, and the only workaround that capitalism has is to invent new monopolies to create artificial scarcity, which are chronically inefficient.
  1. Collaborative production is taking off, ignoring markets entirely.

> The biggest information product in the world -- Wikipedia -- is made by 27,000 volunteers, for free, abolishing the encyclopaedia business and depriving the advertising industry of an estimated $3 billion a year.((p xv))

The main conflict of the near future as postcapitalism tries to emerge is between free, abundant goods and "a system of monopolies, banks and governments trying to keep things private, scarce and commercial."((p xix))
PC
)
