{-# LANGUAGE TemplateHaskell #-}

module Types.API.User where

import Data.Model.User
import Types.API.TH
import Types.User

defineRESTTypesSelf modelUser
