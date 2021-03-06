config = YAML.load_file('config/setup.yml')

lbuser = config.fetch("username").strip
lbpw = config.fetch("password").strip
lbhost = config.fetch("host").strip
lbdb = config.fetch("database").strip

::SQLServer = TinyTds::Client.new(:username => lbuser,:password => lbpw,:host => lbhost,:database => lbdb)

HandleProdWsdl = config.fetch("handle_prod_wsdl").strip
HandleProdGroup = config.fetch("handle_prod_group").strip
HandleProdUser = config.fetch("handle_prod_user").strip
HandleProdCredential = config.fetch("handle_prod_credential").strip

HandleTestWsdl = config.fetch("handle_test_wsdl").strip
HandleTestGroup = config.fetch("handle_test_group").strip
HandleTestUser = config.fetch("handle_test_user").strip
HandleTestCredential = config.fetch("handle_test_credential").strip

HandleBase = config.fetch("handle_test_credential").strip

::SavonProdClient = Savon.client(wsdl: HandleProdWsdl)
::SavonTestClient = Savon.client(wsdl: HandleTestWsdl)

EFSVolume = config.fetch("efs_volume").strip

SolrGeoblacklight = config.fetch("solr_geoblacklight").strip

Fedora = config.fetch("findit_fedora").strip

JP2Volume = config.fetch("jp2_volume").strip

Aws.config.update({
  credentials: Aws::Credentials.new(config.fetch("aws_access_key_id").strip,config.fetch("aws_secret_access_key").strip)
})

IIIF_URL = config.fetch("iiif_endpoint").strip

S3 = Aws::S3::Resource.new(region: 'us-east-1')
#S3.timeout = 120
