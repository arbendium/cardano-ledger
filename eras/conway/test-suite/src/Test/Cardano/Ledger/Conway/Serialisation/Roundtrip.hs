{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

module Test.Cardano.Ledger.Conway.Serialisation.Roundtrip (allprops) where

import Cardano.Ledger.Conway.Genesis (ConwayGenesis (..))
import Cardano.Ledger.Core (Era (..))
import Data.Data (Proxy (..), typeRep)
import Test.Cardano.Ledger.Conway.Serialisation.Generators ()
import Test.Cardano.Ledger.ShelleyMA.Serialisation.Roundtrip (property)
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.QuickCheck (testProperty)

allprops ::
  forall e.
  ( Era e
  ) =>
  TestTree
allprops =
  testGroup
    (show $ typeRep (Proxy @e))
    [ testProperty "ConwayGenesis" $ property @(ConwayGenesis (EraCrypto e))
    ]