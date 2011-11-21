# Custom sanitize configuration based on RELAXED
class Sanitize
  module Config
        
    # ================
    # = Transformers =
    # ================
    
    # Remove successive brs
    remove_multiple_brs = lambda do |env|
      node = env[:node]
      node_name = env[:node_name]
      
      if node_name == "br"
        if node.next_sibling
          if node.next_sibling.node_name == 'br'
            node.unlink
            {:whitelist_nodes => [node]}
          end
        end
      end
    end
    
    # Remove empty tags
    remove_empty_tags = lambda do |env|
      node = env[:node]
      node_name = env[:node_name]
      
      unless ['br', 'img', 'td', 'th'].include?(node_name)
        if node.element_children.count == 0
          node.content = node.content.strip
          node.unlink if node.content.blank?
          {:whitelist_nodes => [node]}
        end
      end
    end

    # Remove specified id properties
    remove_forbidden_id_properties = lambda do |env|
      forbidden_id_properties = ['forbidden']
      
      node = env[:node]
      
      if (node['class'].split('') & forbidden_id_properties).size > 0
        node['id'] = (node['id'].split('') - forbidden_id_properties).join('')
        node.remove_attribute('id') if node['id'].blank?
        {:whitelist_nodes => [node]}
      end if node['id']
    end

    #  Remove specified class properties.
    remove_forbidden_class_properties = lambda do |env|
      forbidden_class_properties = ['Apple-tab-span', 'forbidden']
      
      node = env[:node]
      
      if (node['class'].split('') & forbidden_class_properties).size > 0
        node['class'] = (node['class'].split('') - forbidden_class_properties).join('')
        node.remove_attribute('class') if node['class'].blank?
        {:whitelist_nodes => [node]}
      end if node['class']
    end
    
    # Escape javascript
    sanitize_script = lambda do |env|
      node = env[:node]
      node_name = env[:node_name]
      
      if node_name == "script"
        unless node['src'].include? "ext.nicovideo.jp" && "source.pixiv.net"
          node = node.replace(CGI.escapeHTML(node.to_s))
          {:whitelist_nodes => [node]}
        end
      end
    end

    # Remove iframe tag for unallowed sites
    remove_iframe_for_unallowed_sites = lambda do |env|
      node = env[:node]
      node_name = env[:node_name]

      if node_name == "iframe"
        unless node['src'].include? "youtube.com" && "nicovideo.jp"
          node.unlink
          {:whitelist_nodes => [node]}
        end        
      end
    end

    # Remove embed tag for unallowed sites
    remove_embed_for_unallowed_sites = lambda do |env|
      node = env[:node]
      node_name = env[:node_name]

      if node_name == "embed"
        unless node['src'].include? "player.soundcloud.com"
          node.unlink
          {:whitelist_nodes => [node]}
        end        
      end
    end


    CUSTOM = {
      # Whether or not to allow HTML comments. Allowing comments is strongly
      # discouraged, since IE allows script execution within conditional
      # comments.
      :allow_comments => false,
      
      # HTML attributes to add to specific elements. By default, no attributes
      # are added.
      :add_attributes => {},
      
      # Output format. Supported formats are :html and :xhtml (which is the
      # default).
      :output => :xhtml,
      
      # Character encoding to use for HTML output. Default is 'utf-8'.
      :output_encoding => "utf-8",
      
      # Whether or not to process text nodes. Enabling this will allow text
      # nodes to be processed by transformers.
      :process_text_nodes => false,
      
      # If this is true, Sanitize will remove the contents of any filtered
      # elements in addition to the elements themselves. By default, Sanitize
      # leaves the safe parts of an element's contents behind when the element
      # is removed.
      #
      # If this is an Array of element names, then only the contents of the
      # specified elements (when filtered) will be removed, and the contents of
      # all other filtered elements will be left behind.
      :remove_contents => false,
      
      # Transformers allow you to filter or alter nodes using custom logic. See
      # README.rdoc for details and examples.
      :transformers => [remove_multiple_brs, 
      #                  remove_empty_tags,
                        remove_forbidden_id_properties,
                        remove_forbidden_class_properties,
                        remove_iframe_for_unallowed_sites,
                        sanitize_script],
      
      :elements => [
        'a', 'b', 'blockquote', 'br', 'caption', 'cite', 'code', 'col',
        'colgroup', 'dd', 'del', 'dl', 'dt', 'em', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6',
        'i', 'img', 'li', 'ol', 'p', 'pre', 'q', 'small', 'strike', 'strong',
        'sub', 'sup', 'table', 'tbody', 'td', 'tfoot', 'th', 'thead', 'tr', 'u',
        'ul', 'span', 'div', 'iframe', 'script', 'noscript','object','param','embed'],

      :attributes => {
        :all => ['class', 'id', 'style'],
        'a'          => ['href', 'title', 'target'],
        'blockquote' => ['cite'],
        'col'        => ['span', 'width'],
        'colgroup'   => ['span', 'width'],
        'del'        => ['cite', 'datetime'],
        'img'        => ['align', 'alt', 'height', 'src', 'title', 'width'],
        'ol'         => ['start', 'type'],
        'q'          => ['cite'],
        'table'      => ['summary', 'width'],
        'td'         => ['abbr', 'axis', 'colspan', 'rowspan', 'width'],
        'th'         => ['abbr', 'axis', 'colspan', 'rowspan', 'scope',
                         'width'],
        'ul'         => ['type'],
        'iframe'     => ['src', 'width', 'height', 'frameborder', 'allowfullscreen'],
        'script'     => ['src', 'type', 'data-id', 'data-size','data-border','charset'],
        'object'     => ['width', 'height'],
        'param'      => ['name', 'value'],
        'embed'      => ['allowscriptaccess','src', 'type','width', 'height']
      },

      :protocols => {
        'a'          => {'href' => ['ftp', 'http', 'https', 'mailto',
                                    :relative]},
        'blockquote' => {'cite' => ['http', 'https', :relative]},
        'blockquote' => {'cite' => ['http', 'https', :relative]},
        'img'        => {'src'  => ['http', 'https', :relative]},
        'q'          => {'cite' => ['http', 'https', :relative]},
        'iframe'     => {'src'  => ['http']},
        'script'     => {'src'  => ['http']},
        'param'      => {'value'  => ['http', 'https']},
        'embed'      => {'src'  => ['https']}
      }
    }
  end
end
