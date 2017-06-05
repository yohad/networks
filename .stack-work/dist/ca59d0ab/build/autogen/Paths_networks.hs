{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_networks (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "D:\\Haskell\\networks\\.stack-work\\install\\65995373\\bin"
libdir     = "D:\\Haskell\\networks\\.stack-work\\install\\65995373\\lib\\x86_64-windows-ghc-8.0.2\\networks-0.1.0.0-8MvwABPgKe0DIamyIk8TMx"
dynlibdir  = "D:\\Haskell\\networks\\.stack-work\\install\\65995373\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "D:\\Haskell\\networks\\.stack-work\\install\\65995373\\share\\x86_64-windows-ghc-8.0.2\\networks-0.1.0.0"
libexecdir = "D:\\Haskell\\networks\\.stack-work\\install\\65995373\\libexec"
sysconfdir = "D:\\Haskell\\networks\\.stack-work\\install\\65995373\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "networks_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "networks_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "networks_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "networks_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "networks_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "networks_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
