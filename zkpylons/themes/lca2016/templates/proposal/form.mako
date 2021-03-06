<%page args="editing" />
    <div class="form-group">
      <label for="proposaltitle" class="col-sm-2 control-label">Title</label>
      <div class="input-group">
% if editing:
        <input type="text" id="proposaltitle" class="form-control" placeholder="${ c.title }" name="proposal.title" required />
% else:
        <input type="text" id="proposaltitle" class="form-control" placeholder="Talk title" name="proposal.title" required/>
%endif
        <span class="glyphicon form-control-feedback" ></span>
        <span class="input-group-addon" id="basic-addon2">required &nbsp; &nbsp; &nbsp;</span>

      </div>
    </div>

    
      <label for="proposaltype" class="col-sm-2 control-label">The type of your proposal. </label>
% for st in c.proposal_types:
<%
   if st.name == 'Miniconf':
       continue
%>
    <div class="input-group">
      <label>
        <input type="radio" name="proposal.type" id="proposal.type_${ st.id }" value="${ st.id }">
        ${ st.name }
      </label>
    </div>
% endfor

    <div class="form-group"> 
      <div class="textarea">
        <label for="proposalabstract" class="col-sm-2 control-label">Public Abstract</label>
        <div class="input-group col-sm-10">
            <textarea class="form-control" id="proposalabstract" placeholder="This will appear in the conference programme. You will have an opportunity to update it once the proposal is accepted, but it should reasonably reflect what you will be presenting, and in any case it will appear as-is on the website in the draft programme. Up to about 500 words." name="proposal.abstract" rows="10" cols="80" required></textarea>
        </div>
      </div>
    </div>

    <div class="form-group"> 
      <div class="textarea">
        <label for="proposalpriveate_abstract" class="col-sm-2 control-label">Private Abstract</label>
        <div class="input-group col-sm-10">
            <textarea class="form-control" id="proposalprivate_abstract" placeholder="This will only be shown to organisers and reviewers. You should provide any details about your proposal that you don't want to be public here." name="proposal.private_abstract" rows="10" cols="80" required></textarea>
        </div>
      </div>
    </div>

    <div class="form-group"> 
      <div class="textarea">
        <label for="proposaltechnical_requirements" class="col-sm-2 control-label">Technical Requirements</label>
        <div class="input-group col-sm-10">
            <textarea class="form-control" id="proposalprivate_abstract" placeholder="Speakers will be provided with: Internet access, power, projector, audio.  If you require anything in addition, please list your technical requirements here.  Such as: a static IP address, A/V equipment or will be demonstrating security-related techniques on the conference network." name="proposal.technical_requirements" rows="10" cols="80"></textarea>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label for="proposalaudience" class="col-sm-2 control-label">Target audience</label>
          <div class="col-sm-8">
% for at in c.target_audiences:
            <div class="radio">
              <label>
                <input type="radio" name="proposal.audience" id="proposal.audience_${ at.id }" value="${ at.id }">
                ${ at.name }
              </label>
            </div>
% endfor
          </div>
    </div>

    <div class="form-group">
      <label for="proposalproject" class="col-sm-2 control-label">Project</label>
      <div class="col-sm-10">
% if editing:
        <input type="text" id="proposalproject" class="form-control" placeholder="${ c.title }" name="proposal.project" />
% else:
        <input type="text" id="proposalproject" class="form-control" placeholder="The name of the project you will be talking about" name="proposal.project" />
%endif
      </div>
    </div>

    <div class="form-group">
      <label for="proposalurl" class="col-sm-2 control-label">Project URL (Optional)</label>
      <div class="col-sm-10">
% if editing:
        <input type="text" id="proposalurl" class="form-control" placeholder="${ c.title }" name="proposal.url" />
% else:
        <input type="text" id="proposalurl" class="form-control" placeholder="www" name="proposal.url" />
%endif
      </div>
    </div>

    <div class="form-group">
      <label for="proposalabstract_video_url" class="col-sm-2 control-label">Project Video (Optional)</label>
      <div class="col-sm-10">
% if editing:
        <input type="text" id="proposalabstract_video_url" class="form-control" placeholder="${ c.title }" name="proposal.abstract_video_url" />
% else:
        <input type="text" id="proposalabstract_video_url" class="form-control" placeholder="www" name="proposal.abstract_video_url" />
%endif
      </div>
    </div>


% if not editing:
    <div class="form-group">
      <label for="proposalabstract_video_url" class="col-sm-2 control-label">Additional Files</label>
      <div class="col-sm-10">
        <input type="file" id="attachment" name="attachment">
        <p class="help-block">Any additional information, image, etc. You can attach and delete more files later by editing this submission.</p>
% else:
    <p class="entries">${ h.link_to('Add an attachment', url=h.url_for(action='attach')) } ${ h.hidden('attachment', size=60) }<span class="note">You can attach multiple files by following this link.</span></p>
% endif
      </div>
    </div>

<!-- Travel assistance -->
% if h.lca_info['cfp_hide_assistance_options'] is 'no':
    <h2>Travel &amp; Accommodation Assistance</h2>
    <p class="lead">linux.conf.au has some funds available to provide travel and accommodation for selected speakers, both from the local region and internationally.</p>

    <p class="lead">Please note that <b>free admission</b> to the full conference is awarded to all primary speakers.</p>

    <div class="form-group">
    <label for="proposal.travel_assistance" class="col-sm-2 control-label">Travel Assistance</label>
<% onclick = "document.getElementById('travelwarning').style.display = 'none';" %>
% for ta in c.travel_assistance_types:
    <div class="radio col-sm-10">
      <label>
% if ta.id == 1:
        <input type="radio" name="proposal.travel_assistance" id="proposal.travel_assistance_${ ta.id }" onclick = "document.getElementById('travelwarning').style.display = 'none';" value="1" checked="checked">
% else:
        <input type="radio" name="proposal.travel_assistance" id="proposal.travel_assistance_${ ta.id }" value="${ ta.id }" onclick = "document.getElementById('travelwarning').style.display = '';">
% endif
        ${ ta.name }
      </label>
    </div>
% endfor
    <div id="travelwarning" class="alert alert-info" role="alert" style="display: none"><p class="warningbox" >WARNING: We have a limited travel budget and requesting travel assistance <b>affects     your chances of acceptance</b>.</p></div>
    </div>

    <div class="form-group">
    <label for="proposal.accommodation_assistance" class="col-sm-2 control-label">Accommodation Assistance</label>
% for aa in c.accommodation_assistance_types:
    <div class="radio col-sm-10">
      <label>
% if aa.id == 1:
        <input type="radio" name="proposal.accommodation_assistance" id="proposal.accommodation_assistance_${ aa.id }" value="1" checked="checked">
% else:
        <input type="radio" name="proposal.accommodation_assistance" id="proposal.accommodation_assistance_${ aa.id }" value="${ aa.id }" >
% endif
        ${ aa.name }
      </label>
    </div>
% endfor
    </div>

% else:
    ${ h.hidden('proposal.travel_assistance') }
    ${ h.hidden('proposal.accommodation_assistance') }
% endif

% if h.lca_info['cfp_hide_assistance_options'] is 'by_email': 
    <h3>Travel &amp; Accommodation Assistance</h3>
    <p class="lead" >Please note that <b>free admission</b> to the full conference is offered to all speakers.</p>
    <p class="lead" >Travel &amp; accommodation assistance <em>may</em> be available in circumstances where it is absolutely necessary. To find out more please e-mail <em>${ h.lca_info['contact_email'] }</em>.</p>
% endif
<!-- / Travel assistance -->

<!-- About the speaker -->
    <h2>About yourself</h2>

    <p class="lead"><em>Note: These settings are common for all your proposals: presentations and tutorials.</em></p>

    <p class="lead">If two or more people are presenting together, this information should for the primary speaker; mention the other speakers in the Abstract, eg. "(with Bob Vaxhacker and Eve Duo)".</p>

    <div class="form-group"> 
      <label for="name" class="col-sm-2 control-label">Speakers name</label>
      <div class="input-group" class="col-sm-10">
        <input class="form-control" id="name" readonly name="name" required></input>
        <span class="input-group-addon" id="basic-addon2">See user profile</span>
      </div>
    </div>

    <div class="form-group"> 
      <label for="name" class="col-sm-2 control-label">Speakers phone</label>
      <div class="input-group" class="col-sm-10">
        <input class="form-control" id="personphone" name="person.phone" required></input>
      <p class="help-block">The conference team will need this to contact you during the conference week. If you don't have one, or do not wish to provide it, then enter NONE in this field</p>
      </div>
    </div>

    <div class="form-group"> 
      <label for="personurl" class="col-sm-2 control-label">Speakers homepage</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="personurl" name="person.url" placeholder="www" ></input>
      </div>
    </div>

    <div class="form-group"> 
      <div class="textarea">
        <label for="personbio" class="col-sm-2 control-label">Biography</label>
        <div class="input-group">
            <textarea class="form-control" id="personbio" placeholder="This will appear on the conference website and in the programme.  Please write in the third person, eg Alice is a KVM hacker..., 150-200 words." name="person.bio" rows="10" cols="80" required></textarea>
        </div>
      </div>
    </div>

    <div class="form-group"> 
      <div class="textarea">
        <label for="personexperience" class="col-sm-2 control-label">Speaking Experience</label>
        <div class="input-group">
            <textarea class="form-control" id="personexperience" placeholder="Have you had any experience presenting elsewhere? If so, we'd like to know. Anything you put here will only be seen by the organisers and reviewers; use it to convince them why they should accept your proposal." name="person.experience" rows="10" cols="80" required></textarea>
        </div>
      </div>
    </div>
      
      
    <div class="input-group">
      <div class="checkbox">
      <label>
        <input type="checkbox" id="proposalvideo_release" name="proposal.video_release">
        I allow ${ h.lca_info["event_parent_organisation"] } to release any recordings of my presentations, tutorials and minconfs under the <a href="${ h.lca_info["media_license_url"] }">${ h.lca_info["media_license_name"] }</a>
      </label>
      </div>
    </div>

    <div class="input-group">
      <div class="checkbox">
      <label>
        <input type="checkbox" id="proposalslides_release" name="proposal.slides_release">
        I allow ${ h.lca_info["event_parent_organisation"] } to release any other material (such as slides) from my presentations, tutorials and minconfs under the <a href="${ h.lca_info["media_license_url"] }">${ h.lca_info["media_license_name"] }</a>
      </label>
      </div>
    </div>

    <hr />

    <p>We reserve the right to forward proposals (accepted or not) to the miniconf organisers for possible inclusion in the miniconf programme.</p>
