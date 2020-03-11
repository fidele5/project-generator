<?php
    class Validator
    {
        public function __construct() {
            
        }

        public function ValidateField($rules)
        {
            extract($rules);
            try {
                if(isset($field)){
                    if (!isset($minLength)) {
                        $minLength = 4;
                    }
                    
                    if (!isset($maxLength)) {
                        $maxLength = 64;
                    }

                    if (isset($required)) {
                        if ($required) {
                            if (empty($field)) {
                                return "empty field";
                            } elseif (strlen($field) < $minLength) {
                                return "tooshort";
                            } elseif (strlen($field) > $maxLength) {
                                return "toolong";
                            } else {
                                return null;
                            }

                        } else {
                            if (strlen($field) < $minLength) {
                                return "tooshort";
                            } elseif (strlen($field) > $maxLength) {
                                return "toolong";
                            } else {
                                return null;
                            }
                        }
                    }
                }else {
                    throw new Exception("The field is required", 1);
                    
                }
            } catch (Exception $e) {
                die("Erreur : ".$e);
            }
        }

        public function ValidatePassword($rules)
		{
            extract($rules);
            try {
                if (isset($field)) {
                    if (!isset($minLength)) {
                        $minLength = 4;
                    }

                    if (!isset($maxLength)) {
                        $maxLength = 64;
                    }

                    if (isset($required)) {
                        if (empty($field)) {
                            return 'empty';
                        } elseif (strlen($field) < $minLength) {
                            extract($maxLength);
                            if (isset($msg)) {
                                return $msg;
                            }
                            else return "tooshort";
                        } elseif (strlen($field) > $maxLength) {
                            extract($maxLength);
                            if (isset($msg)) {
                                return $msg;
                            }
                            else return "toolong";
                        } else {
                            if (isset($matchs)) {
                                extract($matchs);
                                if (!preg_match('#[' . $match . ']{1,}#', $field)) {
                                    if (isset($msg)) {
                                        return $msg;
                                    }
                                    else return 'nofigure';
                                } else {
                                    if (isset($confirmed)) {
                                        extract($confirmed);
                                        if ($field != $confirm) {
                                            if (isset($msg)) {
                                                return $msg;
                                            }else return "differents fields";
                                        }
                                        else return null;
                                    }
                                }
                            } else {
                                return null;
                            }
                        }
                    } else {
                        if (strlen($field) < $minLength) {
                            extract($minLength);
                            if (isset($msg)) {
                                return $msg;
                            }
                            else return "tooshort";
                        } elseif (strlen($field) > $maxLength) {
                            extract($maxLength);
                            if (isset($msg)) {
                                return $msg;
                            }
                            else return "toolong";
                        } else {
                            if (isset($matchs)) {
                                extract($matchs);
                                if (!preg_match('#[' . $match . ']{1,}#', $field)) {
                                    if (isset($msg)) {
                                        return $msg;
                                    }
                                    else return 'nofigure';
                                } else {
                                    extract($confirmed);
                                    if ($field != $confirm) {
                                        if (isset($msg)) {
                                            return $msg;
                                        } else {
                                            return "differents fields";
                                        }

                                    } else {
                                        return null;
                                    }
                                }
                            } else {
                                return null;
                            }
                        }
                    }
                } else {
                    throw new Exception("Error Processing Request", 1);
                }
   
            } catch (Exception $e) {
                die('Erreur : '.$e);
            }
        }
    }

    $validator = new Validator;
    //echo $validator->ValidateField(['field'=>'fdel', 'minLength'=>8, 'required'=>true]);
    echo $validator->ValidatePassword([
        'field'=>'fidele12', 
        'length'=>['minLength'=>8, 'msg'=>"Le mot de passe doit avoir au moins 8 caractères"], 
        'matchs'=>['match'=>'0-9', 'msg'=>'Le mot de passe doit avoir au moins un chiffre'],
        'confirmed'=>['confirm'=>'fidel', 'msg'=>'Les deux mots de passe ne correspondent pas'],
        'required'=>true]);