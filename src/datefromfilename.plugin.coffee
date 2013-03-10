dateRegExp = /\b(\d{4})[-_ ]?(\d{2})[-_ ]?(\d{2})[-_ ]?/

module.exports = (BasePlugin) ->

  class DateFromFileNamePlugin extends BasePlugin
    # Plugin Name
    name: 'datefromfilename'
    
    config:
      removeDate: false

    renderBefore: (opts, next) ->
      {collection, templateData} = opts
      config = @config

      collection.forEach (document) ->  
            
        # Trying to parse filename
        return unless date = document.get('basename').match(dateRegExp)
        
        # Removing date from output filename if necessary
        if config.removeDate
          document.id = document.id.replace(dateRegExp, '')
          document.set('basename', document.get('basename').replace(dateRegExp, ''))
          document.set('outPath', document.get('outPath').replace(dateRegExp, ''))

        # Date from has priority over filename
        unless document.getMeta().get('date')
          date = new Date(date[1] + '-' + date[2] + '-' + date[3])
          document.getMeta().set('date', date)
          document.set('date', date)
      
      return next()