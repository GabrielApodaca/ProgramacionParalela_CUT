require_relative 'Services'
require 'bcrypt'

Services.configure!
$db = Services.database

def newUser(uName,uEmail)
  $db[:users].insert(name:uName,email:uEmail)
end

def newSite(sName)
  $db[:sites].insert(name:sName)
end

def newPassword(uName,uEmail,uPassword,sName)
  bcPassword= BCrypt::Password.create(uPassword)
  $db[:passwords].insert(user_name:uName,email:uEmail,password:bcPassword,site_name:sName)
end

def updateUserEmail(newEmail, user)
  $db[:passwords].where(user_name:user).update(email:newEmail)
end

def query1(site)
  $db[:passwords].select(:user_name).where(site_name: site).all
end

def query2(user)
  $db[:passwords].select(:site_name).where(user_name:user).all
end