module Types.API.Auth where

import Data.Text
import GHC.Generics
import Servant.API
import Types.Login
import Types.Register
import Types.User
import Web.Cookie     (SetCookie)

type LoginAPI = "login"
    :> ReqBody '[JSON] Login
    :> Post '[JSON] (Headers '[Header "Set-Cookie" SetCookie, Header "Set-Cookie" SetCookie] (Maybe User))

-- @TODO
type RegisterAPI = "register"
    :> ReqBody '[JSON] Register
    :> PostCreated '[JSON] User

type VerifyAPI = "verify"
    :> QueryParam "token" Text
    :> GetNoContent

type ForgotAPI = "forgot"
    :> ReqBody '[JSON] Login
    :> GetNoContent

data AuthAPI mode = AuthAPI {
    loginRoute    :: mode :- LoginAPI,
    registerRoute :: mode :- RegisterAPI,
    verifyRoute   :: mode :- VerifyAPI,
    forgotRoute   :: mode :- ForgotAPI
} deriving stock Generic
