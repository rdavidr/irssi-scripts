#my own signals
use Irssi qw ( signal_register );

signal_register( { 'show uptime'      => [ 'iobject','string'                   ]}); #server,chan
signal_register( { 'search imdb'      => [ 'iobject','string','string'          ]}); #server,chan,text
signal_register( { 'calculate'        => [ 'iobject','string','string'          ]}); #server,chan,text
signal_register( { 'search isohunt'   => [ 'iobject','string','string'          ]}); #server,chan,text
signal_register( { 'get temp'         => [ 'iobject','string'                   ]}); #server,chan
signal_register( { 'google me'        => [ 'iobject','string','string'          ]}); #server,chan,query
signal_register( { 'check title'      => [ 'iobject','string','string'          ]}); #server,chan,url
signal_register( { 'karmadecay'       => [ 'iobject','string','string'          ]}); #server,chan,url
signal_register( { 'check tubes'      => [ 'iobject','string','string'          ]}); #server,chan,vid
signal_register( { 'check vimeo'      => [ 'iobject','string','string'          ]}); #server,chan,vid
signal_register( { 'random quotes'    => [ 'iobject','string'                   ]}); #server,chan
signal_register( { 'last quote'       => [ 'iobject','string','string'          ]}); #server,chan,lastquote
signal_register( { 'add quotes'       => [ 'iobject','string','string'          ]}); #server,chan,text
signal_register( { 'delete quote'     => [ 'iobject','string','string'          ]}); #server,chan,delete_me
signal_register( { 'find quote'       => [ 'iobject','string','string'          ]}); #server,chan,find_me
signal_register( { 'count quotes'     => [ 'iobject','string'                   ]}); #server,chan
signal_register( { 'showme the money' => [ 'iobject','string','string'          ]}); #server,chan,text
signal_register( { 'showme the usd'   => [ 'iobject','string','string'          ]}); #server,chan,text
signal_register( { 'showme the euros' => [ 'iobject','string','string'          ]}); #server,chan,text
signal_register( { 'teh fuck is who'  => [ 'iobject','string','string'          ]}); #server,chan,who
signal_register( { 'fetch tweet'      => [ 'iobject','string','string'          ]}); #server,chan,url
signal_register( { 'last tweet'       => [ 'iobject','string','string'          ]}); #server,chan,user
signal_register( { 'karma check'      => [ 'iobject','string','string'          ]}); #server,chan,name
signal_register( { 'karma set'        => [ 'iobject','string','string','string' ]}); #server,chan,key,val
signal_register( { 'karma bitch'      => [ 'string' ,'string','string'          ]}); #thingy,op,list
signal_register( { 'karma rank'       => [ 'iobject','string'                   ]}); #server,chan
signal_register( { 'karma flip'       => [ 'iobject','string'                   ]}); #server,chan
signal_register( { 'post sysarmy'     => [ 'iobject','string','string'          ]}); #server,chan,text
signal_register( { 'tweet quote'      => [           'string'                   ]}); #addme
signal_register( { 'white rabbit'     => [ 'iobject','string','string'          ]}); #server,chan,new_friend
signal_register( { 'shit I say'       => [ 'iobject','string','string'          ]}); #server,chan,tweet_this
signal_register( { 'mercadolibre'     => [ 'iobject','string','string'          ]}); #server,chan,mla
signal_register( { 'reimgur'          => [ 'iobject','string','string'          ]}); #server,chan,url
signal_register( { 'write to file'    => [           'string'                   ]}); #text
signal_register( { 'cuac cuac go'     => [ 'iobject','string','string'          ]}); #server,chan,query
signal_register( { 'gold digger'      => [ 'iobject','string','string'          ]}); #server,chan,btc
signal_register( { 'silver digger'    => [ 'iobject','string','string'          ]}); #server,chan,ltc
signal_register( { 'ethereum'         => [ 'iobject','string'                   ]}); #server,chan
signal_register( { 'insert coins'     => [ 'iobject','string','string'          ]}); #server,chan,$pair
signal_register( { 'such signal'      => [ 'iobject','string','string'          ]}); #server,chan,$text
signal_register( { 'such difficult'   => [ 'iobject','string','string'          ]}); #server,chan,$text
signal_register( { 'arrr'             => [ 'iobject','string','string'          ]}); #server,chan,$text
signal_register( { 'weather'          => [ 'iobject','string','string'          ]}); #server,chan,$city
signal_register( { 'wolfram'          => [ 'iobject','string','string'          ]}); #server,chan,$query
signal_register( { 'bofh'             => [ 'iobject','string'                   ]}); #server,chan,$query
signal_register( { 'bash quotes'      => [ 'iobject','string','string'          ]}); #server,chan,$text
signal_register( { 'hay subte'        => [ 'iobject','string','string'          ]}); #server,chan,$linea
signal_register( { 'excusa get'       => [ 'iobject','string'                   ]}); #server,chan
signal_register( { 'excusa add'       => [ 'iobject','string','string'          ]}); #server,chan,$excusa
signal_register( { 'birras get'       => [ 'iobject','string'                   ]}); #server,chan
signal_register( { 'chix meetup'      => [ 'iobject','string'                   ]}); #server,chan
signal_register( { 'need translate'   => [ 'iobject','string','string','string' ]}); #server,chan,$lang,$text
signal_register( { 'coronavirus'      => [ 'iobject','string','string'          ]}); #server,chan,$country
signal_register( { 'worknowork'       => [ 'iobject','string'                   ]}); #server,chan
