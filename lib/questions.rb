module Questions
  QUESTIONS_AND_ANSWERS = {
    quality: {
      question: 'What would you say is your best quality?',
      answers: {
        'Intelligence' => {
          cyclone: 2,
          spellbinder: 1
        },
        'Creativity' => {
          spellbinder: 2,
          cyclone: 1
        },
        'Compassion' => {
          farrco: 2,
          hequera: 1
        },
        'Passion' => {
          balon: 2,
          king: 1,
          farrco: 1
        },
        'Persistence' => {
          balon: 1,
          king: 2,
          hequera: 2
        }
      }
    },
    intro_extro: {
      question: 'Which are you more?',
      answers: {
        'Extroverted' => {
          cyclone: 2,
          farrco: 2,
          balon: 2
        },
        'Introverted' => {
          king: 2,
          spellbinder: 2,
          hequera: 2
        }
      }
    },
    art: {
      question: 'Which is most important?',
      answers: {
        'Rationality' => {
          cyclone: 2,
          king: 2,
          farrco: 1
        },
        'Spirituality' => {
          cyclone: 1,
          spellbinder: 1,
          farrco: 2,
          hequera: 2
        },
        'Magic' => {
          spellbinder: 2,
          balon: 1
        },
        'Strength' => {
          king: 1,
          balon: 2,
          hequera: 1
        }
      }
    },
    element: {
      question: 'Element?',
      answers: {
        'Fire' => {
          cyclone: 1,
          king: 1,
          farrco: 2,
          balon: 2
        },
        'Water' => {
          cyclone: 2,
          spellbinder: 1,
          balon: 1
        },
        'Earth' => {
          king: 2,
          farrco: 1,
          hequera: 2
        },
        'Air' => {
          spellbinder: 2,
          hequera: 1
        }
      }
    },
    hogwarts: {
      question: 'Hogwarts House?',
      answers: {
        'Gryffindor' => {
          king: 2,
          farrco: 1,
          balon: 2,
          hequera: 1
        },
        'Ravenclaw' => {
          cyclone: 1,
          spellbinder: 2
        },
        'Slytherin' => {
          cyclone: 2,
          spellbinder: 1,
          balon: 1
        },
        'Hufflepuff' => {
          king: 1,
          farrco: 2,
          hequera: 2
        }
      }
    },
    hobby: {
      question: 'What is your hobby?',
      answers: {
        'Reading' => {
          king: 2,
          farrco: 2,
          balon: 1
        },
        'Philosophy' => {
          cyclone: 2,
          farrco: 1,
          spellbinder: 1
        },
        'Tinkering' => {
          cyclone: 1,
          spellbinder: 2,
          hequera: 1
        },
        'Training' => {
          king: 1,
          balon: 2,
          hequera: 2
        }
      }
    },
    problem: {
      question: 'What do you do when confronted with a problem?',
      answers: {
        'Push Through' => {
          cyclone: 2,
          balon: 2,
          hequera: 1
        },
        'Work Around' => {
          cyclone: 1,
          king: 2,
          spellbinder: 2,
          farrco: 1,
          balon: 1
        },
        'Get Help' => {
          king: 1,
          spellbinder: 1,
          farrco: 2,
          hequera: 2
        }
      }
    },
    travel: {
      question: 'How would you travel?',
      answers: {
        'Space Ship' => {
          king: 2,
          spellbinder: 1
        },
        'Magical Teleportation' => {
          king: 1,
          spellbinder: 2
        },
        'Technological Teleportation' => {
          cyclone: 1,
          farrco: 1,
          balon: 2,
          hequera: 2
        },
        'Rifts' => {
          cyclone: 2,
          farrco: 2,
          balon: 1,
          hequera: 1
        }
      }
    },
    insult: {
      question: 'What do you do when someone insults you?',
      answers: {
        'Fight' => {
          cyclone: 1,
          balon: 2
        },
        'Insult Back' => {
          cyclone: 2,
          king: 2,
          balon: 1
        },
        'Rationalize' => {
          farrco: 2,
          spellbinder: 1,
          hequera: 1
        },
        'Ignore' => {
          king: 1,
          spellbinder: 2,
          farrco: 1,
          hequera: 2
        }
      }
    },
    weapon: {
      question: 'Do you wield a weapon?',
      answers: {
        'Yes' => {
          king: 2,
          cyclone: 2,
          balon: 2
        },
        'No' => {
          spellbinder: 2,
          farrco: 2,
          hequera: 2
        }
      }
    }
  }.freeze

  MAX_TOTAL = 20
end
