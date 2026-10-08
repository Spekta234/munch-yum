/// List of enums

enum LocationSearchState { loading, found, notFound }

enum TextSizes { small, medium, large }

enum PaymentStatus { pending, successful, failed }

enum OrderMode { delivery, pickup }

enum OrderingFor { myself, someoneElse}

enum OrderFilter { all, ongoing, delivered, unsuccessful }

enum LoyaltyTier { ruby, bronze, silver, gold, diamond, platinum }

extension LoyaltyTierX on LoyaltyTier {
  String get label => switch (this) {
    LoyaltyTier.ruby => 'Ruby Muncher',
    LoyaltyTier.bronze => 'Bronze Muncher',
    LoyaltyTier.silver => 'Silver Muncher',
    LoyaltyTier.gold => 'Gold Muncher',
    LoyaltyTier.diamond => 'Diamond Muncher',
    LoyaltyTier.platinum => 'Platinum Muncher',
  };

  int get minPoints => switch (this) {
    LoyaltyTier.ruby => 0, LoyaltyTier.bronze => 20, LoyaltyTier.silver => 50,
    LoyaltyTier.gold => 100, LoyaltyTier.diamond => 200, LoyaltyTier.platinum => 300,
  };

  int get maxPoints => switch (this) {
    LoyaltyTier.ruby => 20, LoyaltyTier.bronze => 50, LoyaltyTier.silver => 100,
    LoyaltyTier.gold => 200, LoyaltyTier.diamond => 300, LoyaltyTier.platinum => 500,
  };

}

