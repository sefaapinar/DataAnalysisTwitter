install.packages("ROAuth")
install.packages("twitteR")

install.packages("tm")
install.packages("wordcloud")
install.packages("ggplot2")
install.packages("RColorBrewed")


APIkey <- "3DcLpDBQ3CXN82akns2TgadfY"
APIsecret <- "Q0rLDJ1TmXdxc9Esc8onqyFHs56Gkp6qHWjtGB69jW5ZWWPW8K"
Access_token <- "1296063762-ds5HVkWMElP1jybNjLmiws67161rXLehGUi4RFh"
Access_token_secret <- "0uEngyJm4Q6807twvfaAt4pBpKiMKth5M6JWZpYdqDn4x"


setup_twitter_oauth(APIkey,APIsecret, Access_token,Access_token_secret)

LodosFirtinasi <- searchTwitteR("LodosFırtınası", n=10,)

