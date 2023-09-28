{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators   #-}

module Types.API.Users where

import Data.Model.User
import Types.API.TH
import Types.User

defineRESTTypes modelUser
