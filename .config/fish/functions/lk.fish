function lk --wraps='lsblk -o model,type,name,fstype,size,label,mountpoint,partlabel' --wraps='lsblk -o model,type,name,fstype,size,label,mountpoints,partlabel' --description 'alias lk=lsblk -o model,type,name,fstype,size,label,mountpoints,partlabel'
  lsblk -o model,type,name,fstype,size,label,mountpoints,partlabel $argv; 
end
