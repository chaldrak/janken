# Écrivez la logique qui permet au joueur (lui-même) d'entrer "0 ~ 2".
class Player
  def hand
    # Affichez une phrase qui permet au joueur de sélectionner une main pierre-papier-ciseaux.
    puts "Veuillez saisir un nombre."
    puts "0: Pierre\n1: Papier\n2: Ciseaux"
    # Remplacez la valeur d'entrée du joueur dans la variable "input_hand".
    #Indice : Découvrons la méthode gets.
    input_hand = gets.chomp
    # Si "input_hand" est soit "0, 1, 2", le processus itératif se termine, et s'il ne l'est
    #pas (y compris l'alphabet), le processus itératif continue.
    while true
      # si "input_hand" est l'un des "0, 1, 2"
      #Astuce : Découvrez la méthode include?.
        # Renvoie "input_hand" tel quel.
        #Astuce : utilisez « return » si vous souhaitez renvoyer une valeur de retour et terminer le processus itératif.
      # sinon sinon
        # Affiche une phrase qui demande au joueur d'entrer "0-2".
        # met "0-2 Veuillez saisir un nombre."
        #met "0 : Goo, 1 : Choki, 2 : Par"
        # Remplacez la valeur d'entrée du joueur dans la variable "input_hand".
        # fin si l'instruction se termine
        if input_hand == "0" || input_hand == "1" || input_hand == "2"
          input_hand = input_hand.to_i
          return input_hand
          break
        else
          puts "Veuillez saisir les chiffres 0 à 2"
          input_hand = gets.chomp
        end
    end
  end
end
# Écrivez la logique que l'autre partie génère aléatoirement la valeur de "0 ~ 2".
class Enemy
  def hand
    #Obtenez les valeurs de Goo, Choki et Par au hasard.
    return rand(3)
  end
end
# Écrivez la logique pour jouer à pierre-papier-ciseaux avec "0 ~ 2" entré par le joueur (vous-même) et "0 ~ 2" généré aléatoirement par l'ennemi, et affichez le résultat sur la console.
class Janken
  def pon(player_hand, enemy_hand)
    # Remplacez ["goo", "choki", "par"] la variable "janken".


    janken = ["Pierre", "Papier", "Ciseaux"]
    # "La main de l'autre partie est # {la main de l'autre partie}." Est affiché.
    puts "\n\nLa main de l'adversaire est #{janken[enemy_hand]}.\n\n"
    if  (player_hand - enemy_hand + 3) % 3 == 0
      #Quand la valeur de retour de la classe Player (player_hand) et la valeur de retour de la classe Enemy (enemy_hand) sont identiques
      # "Aiko" est sorti.
      puts "Aiko"
      puts "---------------------------------------------------"
      return true
      # Renvoie "true" pour exécuter à plusieurs reprises des roche-papier-ciseaux.
      #Astuce : Vous pouvez utiliser « return » pour renvoyer une valeur de retour. Cependant, dans Ruby, lors du retour d'une valeur de retour, il est courant de sauvegarder "return".
    elsif (player_hand - enemy_hand + 3) % 3 == 1
      #Si la combinaison est la suivante
      # (player_hand == 0 && ennemi_hand == 1) || (player_hand == 1 && ennemi_hand == 2) || (player_hand == 2 && ennemi_hand == 0)
      # Sortie "Vous gagnez".
      # Renvoie "false" pour terminer rock-paper-scissors.
      puts "Vous gagnez"
      return false
    else
      # Sorties "Vous êtes en train de perdre".
      # Renvoie "false" pour terminer rock-paper-scissors.
      puts "Vous avez perdu"
      return false
    end
  end
end
# Écrivez la logique pour exécuter le jeu roche-papier-ciseaux.
class GameStart
  #En utilisant self, vous pouvez appeler la méthode jankenpon en utilisant le nom de la classe sans instancier GameStart.
  def self.jankenpon
    # Remplacez le Player instancié par la variable "player".


    player = Player.new
    #Assignez une instanciation d'Enemy à la variable "ennemi".



    enemy = Enemy.new
    #Assignez une instanciation de Janken à la variable "janken".


    janken = Janken.new
    # Affectez "true" à la variable "next_game".
    next_game = true
    # Si "next_game" est "false", le processus itératif se termine, et s'il est "true", le processus itératif continue.
    while next_game
      # J'utilise des roche papier ciseaux avec "janken.pon (player.hand, ennemi.hand)".
      # "Janken.pon (player.hand, ennemi.hand)" exécute rock-paper-scissors.
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
# Appelez la méthode jankenpon avec le nom de la classe.
GameStart.jankenpon
