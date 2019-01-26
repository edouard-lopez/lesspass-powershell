$CHARACTER_SUBSETS = [PSCustomObject]@{
    $lowercase: "abcdefghijklmnopqrstuvwxyz",
    $uppercase: "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    $digits: "0123456789",
    $symbols: "!`"#$%&'()*+,-./:;<=>?@[`\]^_``{|}~",
}

function CalcEntropy {
    param(
        $PasswordProfile,
        [String]$MasterPassword
    )
    process{
        System.Security.Cryptography.
        C
    }
}


# function GetSetOfCharacters {
#     param(
#         $Rules=$null
#     )
#     process{}
# }
# function ConsumeEntropy {
#     param(
#         [String]$GeneratedPassword, 
#         [Int]$Quotient, 
#         [String]$SetOfCharacters, 
#         [Int]$MaxLength
#     )
#     process{}
# }
# function InsertStringPseudoRandomly {
#     param(
#         [String]$GeneratedPassword, 
#         [Int]$Entropy, 
#         [String]$String
#     )
#     process{}
# }
# function GetOneCharPerRule {
#     param(
#         [Int]$Entropy, 
#         $Rules
#     )
#     process{}
# }
# function GetConfiguredRules {
#     param(
#         $PasswordProfile
#     )
#     process{}
# }
# function RenderPassword {
#     param(
#         [Int]$Entropy, 
#         $PasswordProfile
#     )
#     process{}
# }
function GeneratePassword {
    param(
        $PasswordProfile, 
        [String]$MasterPassword
    )
    process{
        return "whatever"
    }
}

Export-ModuleMember -Function GeneratePassword
